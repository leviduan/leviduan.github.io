/**
 * Disqus 黑暗模式配置
 * 根据当前主题设置 Disqus 使用深色或浅色主题
 */

// 在 Disqus 加载之前设置配置
window.disqus_config = function () {
  // 检测当前主题
  const currentTheme = document.documentElement.getAttribute('data-theme') || 
                       localStorage.getItem('theme') || 
                       'light';
  
  // 如果是黑暗模式，告诉 Disqus 使用深色主题
  if (currentTheme === 'dark') {
    this.page.theme = 'dark';
  } else {
    this.page.theme = 'light';
  }
  
  // 设置页面的唯一标识符和 URL
  this.page.url = window.location.href;
  this.page.identifier = window.location.pathname;
};


