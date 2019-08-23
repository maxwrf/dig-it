import Typed from 'typed.js';

const loadDynamicBannerText = () => {
  new Typed('.col-thematic-inv', {
    strings: ["CAN I DIG IT"],
    typeSpeed: 50,
    loop: true,
    smartBackspace: false,
    showCursor: false,
    fadeOut: true,
  });
}

export { loadDynamicBannerText };
