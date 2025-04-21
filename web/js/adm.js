const links=document.querySelectorAll('a'),
    bg=document.querySelector('.link-bg');

// 设置选中态
function setActive(el){
    links.forEach(link=>{
        link.classList.remove('active');
    });
    el.classList.add('active');
}

// 遍历所有a标签，绑定点击事件
links.forEach((link,index)=>{
    link.addEventListener('click',e=>{
        // 阻止事件的默认动作
        e.preventDefault();
        // 计算并设置选中态背景的偏移量
        bg.style.transform='translate('+(190*index)+'px,-50%)';
        // 设置选中态
        setActive(e.currentTarget);
    })
})