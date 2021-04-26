function prepareDataFromNative(params) {
    app.message = params;
    return params;
}
if (judgeClient() == 'iOS') {
    window.webkit.messageHandlers.prepareDataFromNative.postMessage(null);
} else {
    $App.prepareDataFromNative(null);
}

function clickVocation(event) {
    if (judgeClient() == 'iOS') {
        window.webkit.messageHandlers.clickVocation.postMessage(app.money);
    } else {
        $App.clickVocation(app.money);
    }
}

function clickStudent(event) {
    if (judgeClient() == 'iOS') {
        window.webkit.messageHandlers.clickStudent.postMessage(app.money);
    } else {
        $App.clickStudent(app.money);
    }
}

function judgeClient() {
    let client = '';
    if (/(iPhone|iPad|iPod|iOS)/i.test(navigator.userAgent)) {  
    client = 'iOS';
    } else if (/(Android)/i.test(navigator.userAgent)) { 
    client = 'Android';
    } else {
    client = 'PC';
    }
    return client;
}
