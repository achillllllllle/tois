import { Controller } from '@hotwired/stimulus';

export default class extends Controller {
  static targets = ['categoryContainer'];

  connect() {
    console.log('hello');
  }

  filter(event) {
    const selectedCategoryId  = event.currentTarget.dataset.categoryId;
    const categorySections = this.categoryContainerTarget.querySelectorAll('.category-section');

    categorySections.forEach((categorySection) => {
      const categoryId = categorySection.dataset.categoryId;

      if (selectedCategoryId === '' || selectedCategoryId === categoryId) {
        categorySection.style.display = 'block';
      } else {
        categorySection.style.display = 'none';
      }
    });

    // Mettre à jour l'état des boutons
    const buttons = event.target.closest('.btn-group').querySelectorAll('.category-btn');
    buttons.forEach((btn) => {
      btn.classList.remove('active');
    });
    event.target.classList.add('active');
  }

  clearFilter() {
    const allCategoriesBtn = document.querySelector('button[data-category-id=""]');
    allCategoriesBtn.click();
  }
}
