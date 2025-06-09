window.onload = function () {
    const modal = document.getElementById("myModal");
    const modalBody = document.getElementById("modalBody");
    const buyBtn = document.getElementById("openModalBtn");
    const lpBtn = document.getElementById("listPlayers");
    const ltBtn = document.getElementById("listTransferences");
    const leBtn = document.getElementById("listEmployees");
    const addBtn = document.getElementById("AddPlayer");

    //persist the changes accross updates in the modal
    const modalFilterState = {
        filterType: null,
        position: null,
        sort: null,
    };
    

    const selectedPlayersMap = {};

    function openModalWithContent(html) {
        modalBody.innerHTML = html;
        modal.style.display = "block";

        

        const closeButton = modalBody.querySelector('.close-button');
        if (closeButton) {
            closeButton.addEventListener("click", function () {
                resetFilterState();
                modal.style.display = "none";
            });
        }


        const searchInput = modalBody.querySelector('#playerSearch');
        const playerList = modalBody.querySelector('#playerList');

        if (searchInput && playerList) {
            searchInput.addEventListener('keydown', function (event) {
                if (event.key === 'Enter') {
                    const searchTerm = searchInput.value;

                    fetch(`/Features/ListPlayers?searchTerm=${encodeURIComponent(searchTerm)}`)
                        .then(response => response.text())
                        .then(html => {
                            openModalWithContent(html);
                        });
                }
            });
        }

        const playerItems = modalBody.querySelectorAll('.player-display');

        playerItems.forEach(item => {
            const playerId = item.getAttribute('data-player-id');

            const deleteBtn = item.querySelector('.delete-btn');
            const editBtn = item.querySelector('.edit-btn');

            // DELETE
            if (deleteBtn) {
                deleteBtn.addEventListener('click', () => {
                    if (confirm("Are you sure you want to delete this player?")) {
                        fetch(`/Features/DeletePlayer?playerId=${playerId}`, {
                            method: 'DELETE'
                        })
                            .then(response => {
                                if (response.ok) {
                                    window.location.reload();
                                } else {
                                    console.error("Something went wrong", response.statusText);
                                }
                            })
                            .catch(error => {
                                console.error("Failed to delete player", error);
                            });
                    }
                });
            }

            // EDIT
            if (editBtn) {
                editBtn.addEventListener('click', () => {
                    // Load edit modal or navigate
                    fetch(`/Features/EditPlayer?playerId=${playerId}`, {
                        method: 'GET'
                    })
                        .then(response => response.text())
                        .then(html => {
                            openModalWithContent(html);
                        })
                        .catch(err => {
                            console.error("Failed to load edit modal", err);
                        });
                });
            }
        });

        const pagination = modalBody.querySelector('.pagination-controls');
        if (pagination) {
            pagination.addEventListener('click', function (e) {
                if (e.target.classList.contains('buy-pagination')) {
                    const page = e.target.getAttribute('data-page');
                    const url = `/Features/BuyPlayer?${buildFilterQuery(page)}`;
                    fetch(url, {
                        method: 'GET'
                    })
                    .then(response => response.text())
                    .then(html => {
                        openModalWithContent(html);
                        setupBuyPlayerModalLogic();
                    });
                }
                else if (e.target.classList.contains('employee-pagination')) {
                    const page = e.target.getAttribute('data-page');
                    fetch(`/Features/ListEmployees?page=${page}`)
                        .then(response => response.text())
                        .then(html => {
                            openModalWithContent(html);
                        });
                }
                else if (e.target.classList.contains('transf-pagination')) {
                    const page = e.target.getAttribute('data-page');
                    fetch(`/Features/ListTransferences?page=${page}`)
                        .then(response => response.text())
                        .then(html => {
                            openModalWithContent(html);
                        });
                }
                else if (e.target.classList.contains('list-players-pagination')) {
                    const page = e.target.getAttribute('data-page');
                    fetch(`/Features/ListPlayers?page=${page}`)
                        .then(response => response.text())
                        .then(html => {
                            openModalWithContent(html);
                        });
                }
                
            });
        }

        //filter configurations
        //update the filter options if there are any
        if (modalFilterState.filterType) {
            filterType.value = modalFilterState.filterType;
        } else {
            const filterType = document.getElementById("filterType");
        }

        if (modalFilterState.position !== null) {
            positionSelect.value = modalFilterState.position;
        } else {
            const positionSelect = document.getElementById("positionSelect");
        }

        if (modalFilterState.sort === 'ASC') {
            ascBtn.classList.add('active');
            descBtn.classList.remove('active');
        } else if (modalFilterState.sort === 'DESC') {
            descBtn.classList.add('active');
            ascBtn.classList.remove('active');
        } else {
            ascBtn.classList.remove('active');
            descBtn.classList.remove('active');
        }
        let currentSort = null;

        document.getElementById("ascBtn").addEventListener("click", () => {
            if (currentSort === "ASC") {
                modalFilterState.sort = null;
                ascBtn.classList.remove("active");
            } else {
                modalFilterState.sort = "ASC";
                ascBtn.classList.add("active");
                descBtn.classList.remove("active");
            }
            console.log("Sort mode:", currentSort);
        });

        document.getElementById("descBtn").addEventListener("click", () => {
            if (currentSort === "DESC") {
                modalFilterState.sort = null;
                descBtn.classList.remove("active");
            } else {
                modalFilterState.sort = "DESC";
                descBtn.classList.add("active");
                ascBtn.classList.remove("active");
            }
            console.log("Sort mode:", currentSort);
        });

        positionSelect.addEventListener("change", (e) => {
            modalFilterState.position = positionSelect.value;
            const page = e.target.getAttribute('data-page');
            const url = `/Features/BuyPlayer?${buildFilterQuery(page)}`;
            fetch(url, {
                method: 'GET'
            })
                .then(response => response.text())
                .then(html => {
                    openModalWithContent(html);
                    setupBuyPlayerModalLogic();
                });
        });

        filterType.addEventListener("change", (e) => {
            modalFilterState.filterType = filterType.value;
            const page = e.target.getAttribute('data-page');
            const url = `/Features/BuyPlayer?${buildFilterQuery(page)}`;
            fetch(url, {
                method: 'GET'
            })
                .then(response => response.text())
                .then(html => {
                    openModalWithContent(html);
                    setupBuyPlayerModalLogic();
                });
        });
    };


    lpBtn.addEventListener("click", function () {
        fetch('/Features/ListPlayers')
            .then(response => response.text())
            .then(html => {
                openModalWithContent(html);
            })
            .catch(error => {
                console.error("Failed to load players list:", error);
            });
    });

    ltBtn.addEventListener("click", function () {
        fetch('/Features/ListTransferences')
            .then(response => response.text())
            .then(html => {
                openModalWithContent(html);
            })
            .catch(erro => {
                console.error("Failed to load transference list: ", erro);
            });

    });

    leBtn.addEventListener("click", function () {
        fetch('/Features/ListEmployees')
            .then(response => response.text())
            .then(html => {
                openModalWithContent(html);
            })
            .catch(erro => {
                console.erro("Failed to load employees list: ", erro);
            });
    });

    addBtn.addEventListener("click", function () {
        fetch('/Features/AddPlayer', {
            method: 'GET',
        })
            .then(response => response.text())
            .then(html => {
                openModalWithContent(html);
            })
            .catch(erro => { 
                console.erro("Failed to load modal", erro);
            });
    });

    document.addEventListener('submit', function (e) {
        if (e.target && e.target.id === 'add-player-form') {
            e.preventDefault();

            const form = e.target;
            const formData = new FormData(form);

            fetch('/Features/AddPlayer', {
                method: 'POST',
                body: formData
            })
                .then(response => {
                    if (response.ok) {
                        const modal = document.querySelector('.modal-content').parentElement;
                        modal.style.display = 'none';
                        window.location.reload(); 
                    } else {
                        alert("Transfer failed.");
                    }
                })
                .catch(err => console.error("Error:", err));
        }
        if (e.target && e.target.id === "update-player-form") {
            e.preventDefault();

            const form = e.target;
            const formData = new FormData(form);

            fetch('/Features/EditPlayer', {
                method: 'PUT',
                body: formData
            })
                .then(response => {
                    if (response.ok) {
                        const modal = document.querySelector('.modal-content').parentElement;
                        modal.style.display = 'none';
                        window.location.reload();
                    } else {
                        alert("Update failed.");
                    }
                })
                .catch(err => console.error("Error:", err));
        }
    });


    
    function setupBuyPlayerModalLogic() {
        const checkboxes = modalBody.querySelectorAll('.player-checkbox');
        const buyButton = modalBody.querySelector('#buyButton');
        const modalContent = modalBody.querySelector('.modal-content');
        const budget = parseFloat(modalContent.dataset.budget);

        function updateBuyButtonState() {
            const total = Object.values(selectedPlayersMap).reduce((sum, val) => sum + val, 0);
            const overBudget = total > budget;

            if (overBudget) {
                alert("Budget exceeded!");
            }

            if (Object.keys(selectedPlayersMap).length > 0 && !overBudget) {
                buyButton.disabled = false;
                buyButton.classList.remove('buy-button-disabled');
                buyButton.classList.add('buy-button-enabled');
            } else {
                buyButton.disabled = true;
                buyButton.classList.remove('buy-button-enabled');
                buyButton.classList.add('buy-button-disabled');
            }
        }

        checkboxes.forEach(cb => {
            const playerId = parseInt(cb.value);
            const marketValue = parseFloat(cb.getAttribute("marketValue"));

            if (selectedPlayersMap[playerId]) {
                cb.checked = true;
            }

            cb.addEventListener('change', function () {
                const currentTotal = Object.values(selectedPlayersMap).reduce((sum, val) => sum + val, 0);
                const newTotal = cb.checked ? currentTotal + marketValue : currentTotal - marketValue;

                if (cb.checked && newTotal > budget) {
                    cb.checked = false;
                    alert("Budget exceeded!");
                    return;
                }

                if (cb.checked) {
                    selectedPlayersMap[playerId] = marketValue;
                } else {
                    delete selectedPlayersMap[playerId];
                }

                updateBuyButtonState();
            });
        });

        updateBuyButtonState();

        buyButton.addEventListener("click", function () {
            fetch("/Features/TransferPlayer", {
                method: "POST",
                headers: { "Content-Type": "application/json" },
                body: JSON.stringify(selectedPlayersMap)
            })
                .then(response => {
                    if (!response.ok) {
                        alert("Transfer failed.");
                    } else {
                        window.location.reload();
                    }
                })
                .catch(err => console.error("Error:", err));
        });
    }


    buyBtn.addEventListener("click", function () {
        fetch('/Features/BuyPlayer')
            .then(response => response.text())
            .then(html => {
                openModalWithContent(html);
                setupBuyPlayerModalLogic();
        });
    });

    //helper methods 
    function resetFilterState() {
        modalFilterState.filterType = null;
        modalFilterState.position = null;
        modalFilterState.sort = null;
    }

    function buildFilterQuery(page) {
        const params = new URLSearchParams();
        params.append('page', page);
        if (modalFilterState.filterType) params.append('filterType', modalFilterState.filterType);
        if (modalFilterState.position) params.append('position', modalFilterState.position);
        if (modalFilterState.sort) params.append('filterOption', modalFilterState.sort); // Assuming your backend expects 'filterOption' for sort
        return params.toString();
    }

    window.showOptions = function (triggerEl) {
        const position = triggerEl.dataset.position;
        const selectedPositionElement = triggerEl;

        fetch(`/Features/ChangePlayer?position=${encodeURIComponent(position)}`)
            .then(response => response.json())
            .then(players => {
                const html = `
                    <div class="modal-content">
                        <button class="close-button">&times;</button>
                        <h2>Select ${position}</h2>
                        <ul>
                            ${players.map(p => `<li class="player-option" style="cursor:pointer; padding: 8px 0;">${p.playerName}</li>`).join("")}
                        </ul>
                    </div>
                `;

                openModalWithContent(html);

                setTimeout(() => {
                    const playerItems = document.querySelectorAll('.player-option');
                    playerItems.forEach(item => {
                        item.addEventListener('click', function () {
                            selectedPositionElement.textContent = this.textContent;
                            modal.style.display = "none";
                        });
                    });
                }, 0);
            });
    };
};
