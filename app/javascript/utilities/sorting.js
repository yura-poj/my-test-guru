document.addEventListener('turbolinks:load', function () {
    let control = document.querySelector('.sort-by-title')
    if (control) { control.addEventListener('click', SortRowsByTitle) }
})

function SortRowsByTitle() {
    let table = document.querySelector('table')
    // Nodelist
    // Docs - https://developer.mozilla.org/en-US/docs/Web/API/NodeList
    let rows = table.querySelectorAll('tr')
    let sortedRows = []

    // select all table rows except the first one which is the header
    for (let i = 1; i < rows.length; i++) {
        sortedRows.push(rows[i])
    }

    let sortedTable = document.createElement('table')
    // sortedTable.classList.add('table')
    sortedTable.appendChild(rows[0])


    if(this.querySelector('.octicon-arrow-up').classList.contains('hide')) {
        sortedRows.sort(compareRowsAsc)
        this.querySelector('.octicon-arrow-up').classList.remove('hide')
        this.querySelector('.octicon-arrow-down').classList.add('hide')
    } else  {
        sortedRows.sort(compareRowsDesc)
        this.querySelector('.octicon-arrow-up').classList.add('hide')
        this.querySelector('.octicon-arrow-down').classList.remove('hide')
    }


    for (let i = 0; i < sortedRows.length; i++){
        sortedTable.appendChild(sortedRows[i])
    }

    table.parentNode.replaceChild(sortedTable, table)
}

    function compareRowsAsc(row1, row2) {
        let testTitle1 = row1.querySelector('td').textContent
        let testTitle2 = row2.querySelector('td').textContent

        if (testTitle1 < testTitle2) {
            return -1
        }
        if (testTitle1 > testTitle2) {
            return 1
        }

        return 0

}

function compareRowsDesc(row1, row2) {
    let testTitle1 = row1.querySelector('td').textContent
    let testTitle2 = row2.querySelector('td').textContent

    if (testTitle1 < testTitle2) {
        return 1
    }
    if (testTitle1 > testTitle2) {
        return -1
    }

    return 0
}

