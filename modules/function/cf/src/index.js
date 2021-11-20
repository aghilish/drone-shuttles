const fastify = require('fastify')
const app = fastify({ logger: true })
const mariadb = require('mariadb');
const pool = mariadb.createPool({
  host: 'my-release-mariadb',
  user: 'bn_ghost',
  password: 'supermaria',
  connectionLimit: 5
});
async function deletePosts() {
  let conn;
  try {
    conn = await pool.getConnection();
    await conn.query("DELETE FROM post");
  } catch (err) {
    throw err;
  } finally {
    if (conn) return conn.end();
  }
}
app.get('/', async (req, res) => {
  await deletePosts();
  return { posts_deleted: true }
})