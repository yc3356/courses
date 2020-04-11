# Copyright 2017, 2013, 2011 Pearson Education, Inc., W.F. Punch & R.J.Enbody
# Modified by Donald F. Ferguson, Columbia University, 2018


# Import some frameworks that help us implement a web application.
from flask import Flask, request, make_response

import string

# The external file that implements my check and track correction functions.
import correct_functions
import json


##############################################################################################################
# These are the two functions you will write.
# You will implement in a separate Python file and access via an import statement.

# 1. Check a dictionary to determine if word is correctly spelled.
# 2. If not, call a set of functions that generate "near by, correctly spelled words."
def check_word(word):
    return correct_functions.check_and_suggest_word(word)


# The user selected a correction, or entered a new correct spelling.
# We will record the correct spelling and score as a possible common correction for user.
def update_corrections(original_word, corrected_word):
    # Your code goes here.
    return correct_functions.update_corrections(original_word, corrected_word)

# End of where your code will go.
##############################################################################################################


#
# The main running program is the Flask application engine.
# We register URL endpoint functions below.
# There are some static content directories for serving HTML, CSS, JavaScript, etc.
#
app = Flask(__name__,
            static_url_path='',
            static_folder='web/static',
            template_folder='web/templates')


#
# Implements the path /api/check
# The only web method is GET.
# The query parameters are: word=xxx, where xxx is the word to check.
#
@app.route('/api/check', methods=['GET'])
def api_check():
    print("input = ", str(request.args))
    w = request.args['word']
    print("Input word = ", w)

    result = check_word(w)

    print("check_word rsp = ", result)

    if result == True:
        rsp = json.dumps({"status" : "CORRECT"})
        response = make_response(rsp)
    else:
        rsp = json.dumps({ "status" : "INCORRECT", "original": w, "suggestions": result })
        print("rsp = ", rsp)
        response = make_response(rsp)

    response.headers['Content-Type'] = 'application/json'

    return response


#
# Implements the path /api/check
# The only web method is POST.
# The body is JSON and has two elements:
# 1. original_word: the word the user checked.
# 2. corrected_word: the word the user submitted as a correction.
#
@app.route('/api/correct', methods=['POST'])
def api_correct():

    d = request.data
    print("d = ", d)
    d = json.loads(d)


    w = d['original_word']
    c = d['corrected_word']

    #print("original = " + w)
    #print("corrected = " + c)
    result = update_corrections(w, c)

    rsp = { "msg": result }
    bar = json.dumps(rsp)
    response = make_response(bar)
    response.headers['Content-Type'] = 'application/json'
    print("returning")
    return response

if __name__ == '__main__':
    app.run(debug=True)
