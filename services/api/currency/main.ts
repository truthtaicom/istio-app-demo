import { Application, Router } from "https://deno.land/x/oak/mod.ts";
import ky from 'https://unpkg.com/ky/index.js';
import { process } from 'https://deno.land/std/node/process.ts'

const app = new Application();
const port: number = 3000;

const router = new Router();
router.get("/", async ({ response }: { response: any }) => {
  response.body = await ky.get(`http://data.fixer.io/api/latest?access_key=${process.env.FIXER_API_KEY}`).json();
});


app.use(router.routes());
app.use(router.allowedMethods());

console.log('running on port ', port);
await app.listen({ port });