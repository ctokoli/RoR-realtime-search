document.addEventListener('DOMContentLoaded', function () {
    const searchInput = document.getElementById('search');
    const resultsContainer = document.getElementById('autocomplete-results');
    let debounceTimeout;

    // Event listener for input changes with debounce
    searchInput.addEventListener('input', function () {
        clearTimeout(debounceTimeout);

        debounceTimeout = setTimeout(function () {
            const inputValue = searchInput.value.toLowerCase();

            // Make an AJAX request to fetch autocomplete data
            fetch(`/search?query=${inputValue}`)
                .then(response => response.json())
                .then(data =>  displayResults(data))
                .catch(error => console.error('Error fetching autocomplete data:', error));
        }, 300); // Adjust the debounce delay (in milliseconds) as needed
    });

    // Event listener for item clicks
    resultsContainer.addEventListener('click', function (event) {
        if (event.target.tagName == 'LI') {
            searchInput.value = event.target.innerText;
            resultsContainer.classList.add('hidden');
        }
    });
    
    // Function to display autocomplete results
    function displayResults(results) {
        resultsContainer.innerHTML = '';

        if (results.length == 0 || searchInput.value.length == 0 || searchInput.value == ' ' ) {
            results = ['No results found'];
            resultsContainer.classList.add('hidden');
            return;
        }

        results.forEach(result => {
            const listItem = document.createElement('li');
            listItem.textContent = result;
            listItem.classList.add('p-2', 'border', 'border-gray-300', 'cursor-pointer');
            resultsContainer.appendChild(listItem);
        });

        resultsContainer.classList.remove('hidden');
    }
});
