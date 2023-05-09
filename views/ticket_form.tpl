<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<style>
    #ticket_form {
        background-color: #f2f2f2;
        padding: 50px;
        border-radius: 10px;
        box-shadow: 0px 0px 20px 0px rgba(0,0,0,0.1);
        max-width: 600px;
        margin: 0 auto;
    }
    .title {
        font-size: 2rem;
        font-weight: 600;
        margin-bottom: 30px;
    }
    .field {
        background-color: #fff;
        border: none;
        border-radius: 5px;
        padding: 10px 15px;
        margin-bottom: 20px;
        width: 100%;
        font-size: 1rem;
        font-weight: 400;
    }
    .field:focus {
        outline: none;
        box-shadow: 0px 0px 5px 0px rgba(0,0,0,0.2);
    }
    textarea.field {
        resize: vertical;
    }
    select.field {
        height: auto;
    }
    input[type="submit"] {
        background-color: #007aff;
        color: #fff;
        border: none;
        border-radius: 5px;
        padding: 10px 15px;
        font-size: 1rem;
        font-weight: 600;
        cursor: pointer;
        transition: background-color 0.3s ease;
    }
    input[type="submit"]:hover {
        background-color: #0062cc;
    }
    .feedback {
        color: green;
        font-size: 1rem;
        font-weight: 400;
        margin-bottom: 20px;
    }
</style>
<div id="ticket_form">
    <div class="title">Submit a ticket</div>
  % if feedback:
    <div class="feedback">{{feedback}}</div>
% end

<form action="create_ticket"  method="post">
    <div class="form-group">
        <input type="email" class="form-control field" placeholder="Your Email" name="email" required>
    </div>
    <div class="form-group">
        <input type="text" class="form-control field" placeholder="Ticket Subject" name="subject" required>
    </div>
    <div class="form-group">
        <textarea class="form-control field" rows="6" placeholder="Enter your address" name="address" required></textarea>
    </div>
     <div class="form-group">
        <input type="text" class="form-control field" placeholder="Enter your pin code" name="pin" required>
    </div>
    <div class="form-group">
<!--         <label for="category" class="sr-only">Category</label> -->
        <select class="form-control field custom-select" id="category" name="category" required>
            <option value="">Select category</option>
            <option value="One">One</option>
            <option value="Two">Two</option>
        </select>
    </div>
    <div class="form-group">
        <textarea class="form-control field" rows="6" placeholder="What's the problem?" name="description" required></textarea>
    </div>
    <div class="form-group">
        <input type="submit" class="btn btn-primary" value="Submit">
    </div>
</form>
</div>