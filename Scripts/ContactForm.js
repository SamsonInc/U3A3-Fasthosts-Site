var emailValid;
function validateEmail(email) {
    var re = /^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/;
    return re.test(email);
}

function validate() {
    var $result = $("#result");
    var email = $("#email").val();
    $result.text("");

    if (validateEmail(email)) {
        $("#EmailIndicator").css("backgroundColor", "green");
        emailValid = true;
    } else {
        $("#EmailIndicator").css("backgroundColor", "red");
        emailValid = false;
    }
    return false;
}

function validateName() {
    if ($("#name").value !== "") {
        $("#NameIndicator").css("backgroundColor", "green");
    }
    else {
        $("#NameIndicator").css("backgroundColor", "red");
    }
}

function resetFields(form) {
    $(':input', form).each(function () {
        var type = this.type;
        var tag = this.tagName.toLowerCase();
        if (type === 'text' || type === 'email' || tag === 'textarea')
            this.value = "";
    });
    $(".dot").css("backgroundColor", "red");
}

function check() {
    if (emailValid) {
        alert("That would've worked");
    }
    else {
        alert("Not Valid");
    }
}

function checkMessage() {
    if ($("#message").value !== "") {
        $("#MessageIndicator").css("backgroundColor", "green");
    }
    else {
        $("#MessageIndicator").css("backgroundColor", "red");
    }
}