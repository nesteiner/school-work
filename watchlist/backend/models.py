from backend import db

class Movie(db.Model):
    id    = db.Column(db.Integer, primary_key=True)
    title = db.Column(db.String(60))
    year  = db.Column(db.String(4))

    def serialize(self):
        return {
            'id':    self.id,
            'title': self.title,
            'year' : self.year,
        }
