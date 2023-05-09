from urllib import response
from bottle import route, template, run, static_file, request, response
import json
import requests


@route('/create_ticket', method=['GET', 'POST'])
def handle_form():
    status = ''
    if request.POST:
        # Get the form data
        subject = request.forms.get('subject')
        description = request.forms.get('description')
        address = request.forms.get('address')
        email = request.forms.get('email')
        pin = request.forms.get('pin')
        choice_form = request.forms.get('category')
        print(f"Value of choice_form: {choice_form}")
        if choice_form == "One":
            choice = "aa2ee38f-6db5-4314-aaa9-217c138c96eb"
        elif choice_form == "Two":
            choice = "76c076f4-98ec-4304-953e-4d8acc5a3a05"

        
       
        # Package the data for the API
        data = {"email": email,"title": subject,"description":  "<p style=\"margin-bottom: 0px; margin-top: 0px\">"+ description +"</p>" ,
        "caseCustomProperties": {
            "_c_62f0e10425d78d7affa47ff5" : address,
            "_c_62f0e7c925d78d7affa494e4" : pin,
            "_c_62cff6abcc045d27b1cdc4fc" : choice

        }
        ,"accountId": 31949}
        ticket = json.dumps(data)
        # Make the API request
        url = 'https://prod12-api2.sprinklr.com/api/support-ticket/create-case'
        headers = {'authorization': 'Bearer zLrAN3Y3Pcxe+PqKYCG2eMFwI7Y4QqBGkZkvPzy9iQdlYjk0YjIzNmY0OTI0MWQwMzdjYzEyYWUyYTlhMjQ4Yw==','cookie': 'user.env.type=ENTERPRISE; user.env.type=ENTERPRISE','content-type': 'application/json'}
    
        r = requests.post(
        url,
        data=ticket,
        headers=headers
        
        )

        #If everything went well
        if r.status_code == 201 or r.status_code == 200:
            status = 'Ticket was created.'   
        else:
            status = 'Problem with the request. Status ' + str(r.status_code)
    return template('ticket_form', feedback = status)
    



@route('/css/<filename>')
def send_css(filename):
    return static_file(filename, root='static/css')
run(host='localhost', port=8080, debug=True)
