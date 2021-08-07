import { FunctionParser } from "firebase-backend";
import { FakeDataPopulator } from "./system/fakeDataPopulator";
import admin = require('firebase-admin');

admin.initializeApp();

const firestoreDatabase = admin.firestore();

if (process.env.FUNCTIONS_EMULATOR) {
    console.log('We are running an emulator locally.');

    const populator = new FakeDataPopulator(firestoreDatabase);
    populator.generateFakeData();
}

exports = new FunctionParser(__dirname, exports).exports;