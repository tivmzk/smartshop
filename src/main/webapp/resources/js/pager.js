const state = {
	page: 1,
};

function movePage(page) {
	state.page = page;
	$.ajax(pager_url, {
		method: "GET",
		contentType: "application/json",
		dataType: "json",
		data: state,
		success: function(result) {
			const { list, pager } = result;

			if (list && list.length > 0) {
				const tbody = $(`${pager_root} > tbody`);

				tbody.empty();

				for (let i = 0; i < list.length; i++) {
					addRow(list[i], false);
				}
				
				$(`${pager_root} .page-prev`).data("page", pager.prev);
				$(`${pager_root} .page-next`).data("page", pager.next);
				$(`${pager_root} .page-end`).data("page", pager.end);

				$(`${pager_root} .page-list`).remove();

				const pageList = pager.list;

				for (let i = 0; i < pageList.length; i++) {
					const page_item = $("<div>").addClass("page-item page-list");

					if (pager.page == pageList[i]) {
						page_item.addClass("active");
					}
					const page_link = $("<span>").addClass("page-link");
					page_link.text(pageList[i]);
					page_link.attr("data-page", pageList[i]);

					page_item.append(page_link);
					$(`${pager_root} .page-next`).parent().before(page_item);
				}
			}
		},
		error: function(xhr) {
			alert(`오류 발생 : ${xhr.statusText}`);
		},
	});
}

function addRow(item, pre) {
	let html = "";
	const tbody = $(`${pager_root} > tbody`);
	const { code, name, spec, manufacture, category, price, barcode } = item;

	html += `<tr data-code="${code}">`;
	html += `<td class="code">${code}</td>`;
	html += `<td class="name">${name}</td>`;
	html += `<td class="spec">${spec}</td>`;
	html += `<td class="category">${category}</td>`;
	html += `<td class="manufacture">${manufacture}</td>`;
	html += `<td class="price">${price}</td>`;
	html += `<td class="barcode">${barcode}</td>`;
	html += `<td><span class="btn btn-danger btn-sm delete">삭제</span> <span class="btn btn-info btn-sm update"">수정</span></td>`;
	html += `</tr>`;
	
	if(pre){
		tbody.prepend(html);
	}
	else{
		tbody.append(html);
	}
}

$(function() {
	/*페이져네이션 이벤트 등록*/
	$(pager_root).on("click", `.page-link`, function() {
		const page = $(this).data("page");
		movePage(page);
	});
	/*등록 버튼 이벤트 등록*/
	$("#addModal #add-btn").click(function() {
		const item = {
			name: $("#addModal .name").val(),
			spec: $("#addModal .spec").val(),
			category: $("#addModal .category").val(),
			manufacture: $("#addModal .manufacture").val(),
			price: $("#addModal .price").val(),
			barcode: $("#addModal .barcode").val(),
		};

		$.ajax(pager_url, {
			method: "POST",
			dataType: "json",
			contentType: "application/json",
			data: JSON.stringify(item),
			success: function(result) {
				const { item, pager } = result;
				addRow(item, true);
				$("#addModal input").val(null);
				if ($(`${pager_root} tbody`).children("tr").length > pager.perPage) {
					$(`${pager_root} tbody tr:last-child`).remove();
				}
			},
			error: function(xhr) {
				alert(`오류 발생 : ${xhr.statusText}`);
			},
		});

		$("#addModal").modal("hide");
	});
	/*삭제버튼 이벤트 등록*/
	$(`${pager_root} tbody`).on("click", ".delete", function() {
		const code = $(this).parent().parent().data("code");

		$.ajax(`${pager_url}/${code}`, {
			method: "DELETE",
			contentType: "application/json",
			dataType: "json",
			success: function(result) {
				if (result == code) {
					$(`tr[data-code="${code}"]`).remove();
					const currPage = $('.pagination .page-list.active .page-link').data('page');
					console.log(currPage);
					movePage(currPage);
				}
			},
			error: function(xhr) {
				console.log(xhr.statusText);
			},
		});
	});
	/*수정 버튼 등록*/
	$(`${pager_root} tbody`).on('click', '.update', function() {
		const item = {
			code:$(this).parent().siblings('.code').text(),
			name:$(this).parent().siblings('.name').text(),
			spec:$(this).parent().siblings('.spec').text(),
			category:$(this).parent().siblings('.category').text(),
			manufacture:$(this).parent().siblings('.manufacture').text(),
			price:$(this).parent().siblings('.price').text(),
			barcode:$(this).parent().siblings('.barcode').text()
		};
		
		const modal = $('#updateModal');
		
		for(const key in item){
			modal.find(`.${key}`).val(item[key]);
		}
		
		modal.modal('show');
	});
	
	$('#updateModal #update-btn').click(function(){
		const item = {
			code: $("#updateModal .code").val(),
			name: $("#updateModal .name").val(),
			spec: $("#updateModal .spec").val(),
			category: $("#updateModal .category").val(),
			manufacture: $("#updateModal .manufacture").val(),
			price: $("#updateModal .price").val(),
			barcode: $("#updateModal .barcode").val(),
		};
		
		
		
		$.ajax(pager_url, {
			method: 'PUT',
			data: JSON.stringify(item),
			dataType: 'json',
			contentType: 'application/json',
			success:function(result){
				for(const key in result){
					$(`tr[data-code="${result.code}"] .${key}`).text(result[key]);
				}
				
				$('#updateModal input').val(null);
				$('#updateModal').modal('hide');
			},
			error:function(xhr){
				console.log(xhr.statusText);
			}
		});
	});

	movePage(1);
});
