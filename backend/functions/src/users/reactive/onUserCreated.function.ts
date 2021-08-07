import * as functions from "firebase-functions";

exports.onUserCreated = functions.firestore
.document("clients/{clientId}")
.onCreate((userSnapshot, context) => {
    const data = userSnapshot.data();
    console.log(
        `user created | sent an email to ${data.email}`
    );
})