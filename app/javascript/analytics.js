document.addEventListener('DOMContentLoaded', function () {
    const resultsContainer = document.getElementById('board');
    function fetchResults() {
        fetch('/terms')
        .then(response => response.json())
        .then(data =>  displayResults(data))
        .catch(error => console.error('Error fetching autocomplete data:', error));
    }

    function displayResults(results) {
        console.log(results.data);
        resultsContainer.innerHTML = '';
        
        if (results.data.length == 0 ) {
            results.data = ['No results found'];
        }

        results.data.forEach(result => {
            const listItem = document.createElement('li');
            listItem.textContent = result;
            listItem.classList.add('p-2', 'border', 'border-gray-100', 'hover:bg-pink-200' , 'list-none', 'cursor-pointer');
            resultsContainer.appendChild(listItem);
        });
        
        resultsContainer.classList.remove('hidden');
    }

    setInterval(fetchResults, 1000);
 });
