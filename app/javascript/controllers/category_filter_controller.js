import { Controller } from '@hotwired/stimulus';

export default class extends Controller {
  static targets = ['categoryContainer', 'bookmarksList'];

  connect() {
    console.log('hello');
  }

  filter(event) {
    const selectedCategoryId  = event.currentTarget.dataset.categoryId;
    const categorySections = this.categoryContainerTarget.querySelectorAll('.category-section');
    const seeAllLinks = document.querySelectorAll('.see-all-link');

    categorySections.forEach((categorySection) => {
      const categoryId = categorySection.dataset.categoryId;

      if (selectedCategoryId === '' || selectedCategoryId === categoryId) {
        categorySection.style.display = 'block';
      } else {
        categorySection.style.display = 'none';
      }

      if (selectedCategoryId === '') {
        this.bookmarksListTarget.classList.remove('grid-view');
      } else {
        this.bookmarksListTarget.classList.add('grid-view');
      }
    });

    // Mettre à jour l'état des boutons
    const buttons = event.target.closest('.btn-group').querySelectorAll('.category-btn');
    buttons.forEach((btn) => {
      btn.classList.remove('active');
    });
    event.target.classList.add('active');

    // Afficher ou masquer les liens "See all" en fonction du filtre sélectionné
    if (selectedCategoryId === '') {
      seeAllLinks.forEach((link) => {
        link.style.display = 'inline-block';
      });
    } else {
      seeAllLinks.forEach((link) => {
        link.style.display = 'none';
      });
    }
  }

  clearFilter() {
    const allCategoriesBtn = document.querySelector('button[data-category-id=""]');
    allCategoriesBtn.click();
  }

  seeAll(event) {
    event.preventDefault();
    const categoryId = event.currentTarget.dataset.categoryId;
    const seeAllLink = event.currentTarget;

    seeAllLink.style.display = 'none';

    const categoryButton = document.querySelector(`[data-category-id="${categoryId}"]`);

    if (categoryButton) {
      setTimeout(() => {
        categoryButton.click();
      }, 100);
    }
  }

  hoverSeeAll(event) {
    const categoryId = event.currentTarget.dataset.categoryId;
    const categoryButton = document.querySelector(`[data-category-id="${categoryId}"]`);

    if (categoryButton) {
      categoryButton.classList.add('hover');
    }
  }

  leaveSeeAll(event) {
    const categoryId = event.currentTarget.dataset.categoryId;
    const categoryButton = document.querySelector(`[data-category-id="${categoryId}"]`);

    if (categoryButton) {
      categoryButton.classList.remove('hover');
    }
  }
}
