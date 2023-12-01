
const form = document.getElementById('filters-form');
const resultsContainer = document.getElementById('results');

form.addEventListener('submit', (e) => {

  e.preventDefault();

  // Get data
  const location = document.getElementById('filter-location').value;
  const date = document.getElementById('filter-date').value;
  const category = document.getElementById('filter-category').value;

  // API request
  fetch(`/search?location=${location}&date=${date}&category=${category}`)
    .then(response => response.json())
    .then(data => {
       resultsContainer.innerHTML = data.html;
    });

});
