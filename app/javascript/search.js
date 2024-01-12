document.addEventListener('DOMContentLoaded', function () {
    const searchInput = document.getElementById('search');
    const resultsContainer = document.getElementById('autocomplete-results');
    let debounceTimeout;
    
    searchInput.addEventListener('input', function () {
        clearTimeout(debounceTimeout);

        debounceTimeout = setTimeout(function () {
            const inputValue = searchInput.value.toLowerCase();
            
            fetch(`/search?query=${inputValue}`)
                .then(response => response.json())
                .then(data =>  displayResults(data))
                .catch(error => console.error('Error fetching autocomplete data:', error));
        }, 300); 
    });
    
    resultsContainer.addEventListener('click', function (event) {
        if (event.target.tagName == 'LI') {
            searchInput.value = event.target.innerText;
            resultsContainer.classList.add('hidden');
        }
    });
    
    function displayResults(results) {
        console.log(results.data);
        resultsContainer.innerHTML = '';
        
        if (results.data.length == 0 ) {
            results.data = ['No results found'];
        }

        results.data.forEach(result => {
            const listItem = document.createElement('li');
            listItem.textContent = result;
            listItem.classList.add('p-2', 'border', 'border-gray-300', 'cursor-pointer');
            resultsContainer.appendChild(listItem);
        });
        
        resultsContainer.classList.remove('hidden');
    }
});
