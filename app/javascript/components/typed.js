import Typed from 'typed.js';

const loadDynamicBannerText = () => {
  new Typed('.col-thematic-inv', {
    strings: ["CAN I DIG IT?", "CAN I DIG IT??", "CAN I DIG IT???", "YES YOU CAN"],
    typeSpeed: 50,
    loop: true,
    smartBackspace: false,
    showCursor: false,
    fadeOut: true,
  });
}

export { loadDynamicBannerText };
