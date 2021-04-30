from backend import app, db
from backend.models import Movie
from flask import jsonify, request
# TODO set the url for accept request
# 1. /append
# 2. /all
# 3. /search
# 4. /delete
# 5. /modify

@app.route('/append', methods=['POST'])
def append():
    # title = request.form.get('title')
    # year  = request.form.get('year')
    title = request.json.get('title')
    year  = request.json.get('year')

    db.session.add(Movie(title = title, year = year))
    db.session.commit()

    return jsonify({
        'status': 'append success',
    })

@app.route('/all', methods=['POST'])
def all():
    movies = Movie.query.all()
    return jsonify({
        'status': 'get all movies success',
        'data': list(map(lambda x: x.serialize(), movies)),
    })

@app.route('/search', methods=['POST'])
def search():
    # field = request.form.get('field')
    # string = request.form.get('string')
    field = request.json.get('field')
    string = request.json.get('string')

    movies = []
    status = 'search success'
    if field == 'title':
        movies = Movie.query.filter(Movie.title == string).all()
    elif field == 'year':
        movies = Movie.query.filter(Movie.year == string).all()
    else:
        status = 'search failed'

    return jsonify({
        'status': status,
        'data': list(map(lambda x: x.serialize(), movies))
    })
        
    
@app.route('/delete', methods=['POST'])
def delete():
    id = request.json.get('id')
    movie = Movie.query.get(id)
    db.session.delete(movie)
    db.session.commit()

    return jsonify({
        'status': 'delete success',
    })

@app.route('/modify', methods=['POST'])
def modify():
    id = request.json.get('id')
    title = request.json.get('title')
    year  = request.json.get('year')

    movie = Movie.query.get(id)
    # 处理空值情况
    if title == None:
        title = movie.title
    if year == None:
        year = movie.year

    movie.title = title
    movie.year  = year
    db.session.commit()

    return jsonify({
        'status': 'modify success',
    })

@app.route('/get', methods=['POST'])
def get():
    id = int(request.json.get('id'))
    movie = Movie.query.get(id)
    return jsonify({
        'status': 'get success',
        'data': movie.serialize(),
    })

print('Hello')
