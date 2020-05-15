const express = require('express');
const cors = require('cors');
const mysql = require('mysql');
const fs = require('fs');

const app = express();
app.use(cors());
app.use(express.json());

let credentials = JSON.parse(fs.readFileSync('credentials.json', 'utf8'));
let connection = mysql.createConnection(credentials);
connection.connect();

function rowToObject(row) {
	return {
		event_name: row.event_name,
		month: row.month,
		day: row.day,
		year: row.year,
		start_time: row.start_time,
		end_time: row.end_time
	};
}

app.get('/hangout/:month/:year', (request, response) => {
	const query = 'SELECT id, event_name, month, day, year, start_time, end_time FROM event WHERE is_deleted = 0 AND month = ? AND year = ? ORDER BY day, start_time';
	const params = [request.params.month, request.params.year];
	connection.query(query, params, (error, rows) => {
		response.send({
			ok: true,
			hangout: rows.map(rowToObject),
		});
	});
});

app.post('/hangout', (request, response) => {
	const query = 'INSERT INTO event(event_name, month, day, year, start_time, end_time) VALUES (?, ?, ?, ?, ?, ?)';
	const params = [request.body.event_name, request.body.month, request.body.day, request.body.year, request.body.start_time, request.body.end_time];
	connection.query(query, params, (error, result) => {
		response.send({
			ok: true,
			id: result.insertId,
		});
	});
});

app.patch('/hangout/:id', (request, response) => {
	const query = 'UPDATE event SET event_name = ?, month = ?, day = ?, year = ?, start_time = ?, end_time = ? WHERE id = ?';
	const params = [request.body.event_name, request.body.month, request.body.day, request.body.year, request.body.start_time, request.body.end_time, request.params.id];
	connection.query(query, params, (error, result) => {
		response.send({
			ok: true,
		});
	});
});

app.delete('/hangout/:id', (request, response) => {
	const query = 'UPDATE event SET is_deleted = 1';
	const params = [request.params.id];
	connection.query(query, params, (error, result) => {
		response.send({
			ok: true,
		});
	});
});

const port = 3443;
app.listen(port, () => {
	console.log(`We are live on port ${port}!`);
});
