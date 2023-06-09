/* 키워드 삭제 버튼 */
document.addEventListener("DOMContentLoaded", function () {
    const removeBtns = document.getElementsByClassName("removeBtn");

    for (let i = 0; i < removeBtns.length; i++) {
        removeBtns[i].addEventListener("click", function (event) {
            event.stopPropagation(); // 이벤트 전파 중지

            const span = this.parentNode;
            span.parentNode.removeChild(span);
        });
    }
});

/* 최근 검색어 검색창 자동 입력(x 지우고) */
function addSearchKeyword(element) {
    var text = element.textContent.trim();
    var lastIndex = text.lastIndexOf('✖');
    var keyword = lastIndex !== -1 ? text.substring(0, lastIndex).trim() : text;
    document.getElementById('search').value = keyword;
}

/* 모두 지우기 버튼 클릭 시 모두 삭제 */
document.addEventListener("DOMContentLoaded", function() {
    const removeAllBtn = document.querySelector(".priceView--main__recentSearch button");

    removeAllBtn.addEventListener("click", () => {
        const spanList = document.querySelectorAll(".priceView--main__recentSearch .removeBtn");

        spanList.forEach(function (span) {
            const parent = span.parentNode;
            parent.parentNode.removeChild(parent);
        });
    });
});

/* 인기검색어 검색창 자동 입력 */
document.addEventListener("DOMContentLoaded", function () {
    const popularSearchItems = document.querySelectorAll(".priceView--main__popularSearch li");

    popularSearchItems.forEach(function (item) {
        item.addEventListener("click", function () {
            const searchInput = document.querySelector("#search");
            const searchText = this.textContent;

            searchInput.value = searchText;
        });
    });
});