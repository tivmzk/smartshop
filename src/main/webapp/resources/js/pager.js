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
    success: function (result) {
      const { list, pager } = result;

      if (list && list.length > 0) {
        const tbody = $(`${pager_root} > tbody`);
        let html = "";

        tbody.empty();

        for (let i = 0; i < list.length; i++) {
          const { code, name, spec, manufacture, category, price } = list[i];

          html += `<tr><td>${code}</td><td>${name}</td><td>${spec}</td><td>${category}</td><td>${manufacture}</td><td>${price}</td><td><span class="btn btn-danger btn-sm">삭제</span> <span class="btn btn-info btn-sm">수정</span></td></tr>`;
        }

        tbody.append(html);
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
    error: function (xhr) {
      alert(`오류 발생 : ${xhr.statusText}`);
    },
  });
}

$(function () {
  $(pager_root).on("click", `.page-link`, function () {
    const page = $(this).data("page");
    movePage(page);
  });
  $("#addModel #add-btn").click(function () {
    const item = {
      name: $("#addModel #name").val(),
      spec: $("#addModel #spec").val(),
      category: $("#addModel #category").val(),
      manufacture: $("#addModel #manufacture").val(),
      price: $("#addModel #price").val(),
      barcode: $("#addModel #barcode").val(),
    };

    $.ajax(pager_url, {
      method: "POST",
      dataType: "json",
      contentType: "application/json",
      data: JSON.stringify(item),
      success: function (result) {
		const {item, pager} = result;
        const tbody = $(`${pager_root} > tbody`);
        let html = "";

        const { code, name, spec, manufacture, category, price } = item;

        html += `<tr><td>${code}</td><td>${name}</td><td>${spec}</td><td>${category}</td><td>${manufacture}</td><td>${price}</td><td><span class="btn btn-danger btn-sm">삭제</span> <span class="btn btn-info btn-sm">수정</span></td></tr>`;

        tbody.prepend(html);
        $("#addModel input").val(null);
		if(tbody.children('tr').length > pager.perPage){
			$(`${pager_root} tbody tr:last-child`).remove();
		}
      },
      error: function (xhr) {
        alert(`오류 발생 : ${xhr.statusText}`);
      },
    });

    $("#addModel").modal("hide");
  });
  movePage(1);
});
