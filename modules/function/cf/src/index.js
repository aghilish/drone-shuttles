const fastify = require('fastify')
const app = fastify({ logger: true })
const mariadb = require('mariadb');

const pool = mariadb.createPool({
  host: process.env.MARIA_DB_HOST,
  user: process.env.MARIA_DB_USER,
  password: process.env.MARIA_DB_PASSWORD,
  connectionLimit: 5
});
async function deletePosts() {
  let conn;
  try {
    conn = await pool.getConnection();
    await conn.query("DELETE FROM posts");
  } catch (err) {
    throw err;
  } finally {
    if (conn) return conn.end();
  }
}
app.get('/', async (req, res) => {
  console.log('host:', process.env.MARIA_DB_HOST);
  console.log('user:', process.env.MARIA_DB_USER);
  console.log('password:', process.env.MARIA_DB_PASSWORD);
  await deletePosts();
  return { posts_deleted: true }
});

exports.app = async (req, res) => {
  await app.ready()
  app.server.emit('request', req, res)
}