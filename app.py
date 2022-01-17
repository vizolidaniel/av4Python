from flask import Flask, render_template, request, redirect, url_for, flash
from flask_mysqldb import MySQL



app = Flask(__name__)
app.secret_key = 'random'

app.config['MYSQL_HOST'] = 'localhost'
app.config['MYSQL_USER'] = 'root'
app.config['MYSQL_PASSWORD'] = '123321'
app.config['MYSQL_DB'] = 'crud'

mysql = MySQL(app)



@app.route('/')
def Index():
    cur = mysql.connection.cursor()
    cur.execute("SELECT  * FROM estudantes")
    data = cur.fetchall()
    cur.close()




    return render_template('index2.html', estudantes=data )



@app.route('/insert', methods = ['POST'])
def insert():

    if request.method == "POST":
        flash("Inserido com sucesso!")
        nome = request.form['nome']
        email = request.form['email']
        telefone = request.form['telefone']
        turma_id = request.form['turma_id']
        cur = mysql.connection.cursor()
        cur.execute("INSERT INTO estudantes (nome, email, telefone, turma_id) VALUES (%s, %s, %s, %s)", (nome, email, telefone, turma_id))
        mysql.connection.commit()
        return redirect(url_for('Index'))




@app.route('/delete/<string:id_data>', methods = ['GET'])
def delete(id_data):
    flash("Deletado com Sucesso!")
    cur = mysql.connection.cursor()
    cur.execute("DELETE FROM estudantes WHERE id=%s", (id_data,))
    mysql.connection.commit()
    return redirect(url_for('Index'))





@app.route('/update',methods=['POST','GET'])
def update():

    if request.method == 'POST':
        id_data = request.form['id']
        nome = request.form['nome']
        email = request.form['email']
        telefone = request.form['telefone']
        turma_id = request.form['turma_id']
        cur = mysql.connection.cursor()
        cur.execute("""
               UPDATE estudantes
               SET nome=%s, email=%s, telefone=%s, turma_id=%s
               WHERE id=%s
            """, (nome, email, telefone, turma_id, id_data))
        flash("Updated com Sucesso!")
        mysql.connection.commit()
        return redirect(url_for('Index'))









if __name__ == "__main__":
    app.run(debug=True)
