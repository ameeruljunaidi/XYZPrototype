import { firestore } from "firebase-admin";
import * as faker from "faker";

function log(message: string) {
  console.log(`FakeDataPopulator | ${message}`);
}

export class FakeDataPopulator {
  firestoreDatabase: firestore.Firestore;

  constructor(firestoreDatabase: firestore.Firestore) {
    this.firestoreDatabase = firestoreDatabase;
  }

  async generateFakeData() {
    log("generateFakeData");

    const generateDocument = await this.getGenerateDocument().get();

    if (!generateDocument.exists) {
      await this.createGenerateDocument();
      await this.generateGigs();
    }
  }

  private async generateGigs() {
    log("generateGigs");

    for (let index = 0; index < 30; index++) {
      let gig = {
        gigId: "",
        gigVendorId: "",
        gigTitle: faker.name.jobTitle(),
        gigDescription: faker.name.jobDescriptor(),
        gigPhotos: [
          faker.image.imageUrl(640, 640, "food"),
          faker.image.imageUrl(640, 640, "food"),
          faker.image.imageUrl(640, 640, "food"),
        ],
        gigCategory: faker.commerce.department(),
        gigServiceType: faker.name.jobType(),
        gigPrice: {
          package1: {
            priceTitle: faker.commerce.product(),
            priceDescription: faker.commerce.productDescription(),
            price: faker.datatype.float(2),
            features: {
              feature1: faker.datatype.boolean(),
              feature2: faker.datatype.boolean(),
              feature3: faker.datatype.boolean(),
              feature4: faker.datatype.boolean(),
              feature5: faker.datatype.boolean(),
            },
          },
          package2: {
            priceTitle: faker.commerce.product(),
            priceDescription: faker.commerce.productDescription(),
            price: faker.datatype.float(2),
            features: {
              feature1: faker.datatype.boolean(),
              feature2: faker.datatype.boolean(),
              feature3: faker.datatype.boolean(),
              feature4: faker.datatype.boolean(),
              feature5: faker.datatype.boolean(),
            },
          },
          package3: {
            priceTitle: faker.commerce.product(),
            priceDescription: faker.commerce.productDescription(),
            price: faker.datatype.float(2),
            features: {
              feature1: faker.datatype.boolean(),
              feature2: faker.datatype.boolean(),
              feature3: faker.datatype.boolean(),
              feature4: faker.datatype.boolean(),
              feature5: faker.datatype.boolean(),
            },
          },
        },
        gigFaqs: {
          faq1: faker.lorem.paragraph(2),
          faq2: faker.lorem.paragraph(2),
          faq3: faker.lorem.paragraph(2),
        },
        gigReviews: {
          "review1": faker.lorem.paragraph(2),
          "review2": faker.lorem.paragraph(2),
          "review3": faker.lorem.paragraph(2),
        },
        gigQuote: faker.datatype.boolean(),
        gigRating: faker.datatype.float(2),
        gigRatingNumber: faker.datatype.number(200),
        gigLocation: "addressId",
      };

      let gigId = await this.createGigDocument(gig);
      await this.generateGigsAddress(gigId);
    }
  }

  private async generateGigsAddress(gigId: string) {
    log(`generateGigsAddress at ${gigId}`);

    let gigAddress = {
      id: "addressId",
      placeId: "",
      latitude: faker.address.latitude(),
      longitude: faker.address.longitude(),
      street: faker.address.streetName(),
      streetNumber: "20",
      city: faker.address.city(),
      state: faker.address.state(),
      postalCode: faker.address.zipCode(),
    };

    await this.createGigAddress(gigId, gigAddress);
  }

  private async createGigAddress(gigId: string, gigAddress: any) {
    await this.firestoreDatabase
      .collection("gigs")
      .doc(gigId)
      .collection("addresses")
      .add(gigAddress);
  }

  private async createGigDocument(gig: any): Promise<string> {
    let documentReference = await this.firestoreDatabase
      .collection("gigs")
      .add(gig);
    return documentReference.id;
  }

  private async createGenerateDocument(): Promise<void> {
    log("createGenerateDocument");

    await this.getGenerateDocument().set({});
  }

  private getGenerateDocument(): firestore.DocumentReference {
    return this.firestoreDatabase.collection("data").doc("generate");
  }
}
