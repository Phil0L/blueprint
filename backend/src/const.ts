import dotenv from 'dotenv';
import path from 'path';
import { fileURLToPath } from 'url';

const __filename = fileURLToPath(import.meta.url);
const __dirname = path.dirname(__filename);

export const DOTENV = dotenv.config({ path: [path.resolve(__dirname, '../.env'), path.resolve(__dirname, '../../.env')] }).parsed || {};

export const SYSENV = process.env;

export const ENV = { ...DOTENV, ...SYSENV };

