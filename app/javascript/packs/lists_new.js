var cardHtml = `
    <div class="card">
        <input type="text" class="text-input" name="list[tasks_attributes][][description]" placeholder="Type the task here...">
    </div>`; 

$(document).ready(function () {
    $('#addNewTask').click(function (e) {
        $('.cards-container').append(cardHtml);
        e.preventDefault();
    });
});
