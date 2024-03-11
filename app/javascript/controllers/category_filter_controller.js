// import { Controller } from "@hotwired/stimulus"

// // Connects to data-controller="category-filter"
// export default class extends Controller {

//   static targets = ['categorySection'];

//   connect() {
//     this.categorySections.forEach((section) => {
//       section.setAttribute('data-category-id', section.dataset.categoryId);
//     });
//   }

//   filter(event) {
//     const selectedCategoryId = event.target.dataset.categoryId;
//     const clearFilterBtn = document.getElementById('clear-filter-btn');

//     this.categorySections.forEach((section) => {
//       const categoryId = section.dataset.categoryId;

//       if (selectedCategoryId === '' || selectedCategoryId === categoryId) {
//         section.style.display = 'block';
//       } else {
//         section.style.display = 'none';
//       }
//     });

//     // Mettre à jour l'état du bouton "Toutes les catégories"
//     const allCategoriesBtn = document.querySelector('button[data-category-id=""]');
//     allCategoriesBtn.classList.remove('active');

//     // Mettre à jour l'état du bouton sélectionné
//     event.target.classList.add('active');

//     // Afficher ou masquer la croix de suppression du filtre
//     if (selectedCategoryId !== '') {
//       clearFilterBtn.classList.remove('d-none');
//     } else {
//       clearFilterBtn.classList.add('d-none');
//     }
//   }

//   clearFilter() {
//     const allCategoriesBtn = document.querySelector('button[data-category-id=""]');
//     allCategoriesBtn.click();
//   }
// }
