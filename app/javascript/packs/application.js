import "bootstrap";
import { initAOS } from '../components/aos';
import "plugins/flatpickr";
import { initUpdateNavbarOnScroll } from '../components/navbar';
import { loadDynamicBannerText } from '../components/typed';


initUpdateNavbarOnScroll();
initAOS();
loadDynamicBannerText();
