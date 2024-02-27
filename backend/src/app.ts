import express from 'express';
import cors from 'cors';

const app = express();

app.use(cors());
app.use(express.json());

app.set('port', 3000);

app.get('/', (req, res) => {
  return res.send('Hello world!!\n');
});

app.get('/api/', (req, res) => {
  console.log('Backend is communicating');
  return res.send('response.\n');
});

export const dummy = (a: number): number => {
  return a + 1;
};

export default app;
