const dashboardContainer = document.getElementsByClassName('admin-dashboard-container');
const transactionContainer = document.getElementsByClassName('admin-transaction-container');

function changeDashboard() {
    dashboardContainer[0].style.display = "block";
    transactionContainer[0].style.display = "none";
}

function changeTransactions() {
    dashboardContainer[0].style.display = "none";
    transactionContainer[0].style.display = "block";
}