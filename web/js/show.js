var doms = {
    carousel:document.querySelector('.carousel'),
    indicators:document.querySelectorAll('.indicator span')
};

function moveTo(index){
    doms.carousel.style.transform = `translateX(-${index}00%)`;
    // 去除当前选中的指示器
    var active = document.querySelector('.indicator span.active');
    active.classList.remove('active');
    // 重新设置要选中的指示器
    doms.indicators[index].classList.add('active');
}

doms.indicators.forEach(function (item, i) {
    item.onclick = function(){
        moveTo(i)
    };
});

