import Splide from '@splidejs/splide'

const initSplide = () => {
  if (document.querySelector('.splide')) {
    var splide = new Splide( '.splide', {
      type   : 'loop',
      perPage: 3,
      perMove: 1,
    } );

    splide.mount();
  }
}

export default initSplide
