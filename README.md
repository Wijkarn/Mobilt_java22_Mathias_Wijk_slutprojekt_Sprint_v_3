# Sprint V.3 Slutprojekt Mathias Wijk
My project is a comprehensive mobile application developed using the Flutter framework, designed to provide users with the ability to translate text into various languages and store both the original and translated content in Firebase Firestore. This multifaceted application consists of multiple distinct sections, each dedicated to translating text into a specific language, such as English, Danish, Finnish, and Swedish.

The primary gateway to my application is the homepage. This page serves as the initial point of entry for users, offering a straightforward and user-friendly interface. It presents users with a selection of languages to choose from, setting the stage for the subsequent translation process.

The core functionality of my application revolves around translation pages, each catering to a specific language. These pages share a consistent structure, ensuring a seamless and coherent user experience. Each translation page includes an input field that allows users to input the text they want to translate. This text input field is controlled by a dedicated `TextEditingController`, enabling users to easily enter the desired text. Additionally, a label is provided to guide users, suggesting that they "Start typing to translate."

To initiate the translation process, my application employs the `translator` library. This library, integrated into the project, is responsible for the actual translation of the input text into the chosen target language. Users can trigger the translation process by clicking an "Translate" button, which promptly processes the input text and delivers the translated output.

The translated text is then presented to users on the same page, just below the input field and the translation button. Users can easily view and access the translated content, providing a seamless experience and ensuring they receive the desired information promptly.

Beyond translation, your project embraces the power of cloud technology through its integration with Firebase Firestore. It allows users to save both the original and translated text as data records within a specific "translations" collection. Firebase Firestore acts as a reliable and scalable cloud database, ensuring that user data is securely stored and easily accessible for future reference.

Under the hood, my application's structure is grounded in Flutter's powerful widget system. It leverages various Flutter widgets, including `Scaffold` to frame each page, `AppBar` to set the title and maintain a consistent design, `TextFormField` for user text input, and `ElevatedButton` to trigger the translation process.
