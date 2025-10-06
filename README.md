<h1 align="center">Credit Card Validator App</h1>

<hr>

<h2>Features Implemented</h2>
<ul>
  <li>Clean Architecture: Separation of domain, data, and presentation layers.</li>
  <li>BLoC State Management: Handles adding, loading, and scanning cards.</li>
  <li>Shared Preferences: Stores valid credit cards and banned countries locally.</li>
  <li>Card Type Inference: Automatically detects card type from number.</li>
  <li>Card Scanning: Scan a physical card to pre-fill the number and infer card type.</li>
  <li>Banned Countries: Prevents storage of cards from banned issuing countries.</li>
  <li>Duplicate Prevention: Prevents adding the same card twice.</li>
</ul>

<hr>

<h2>Setup Instructions</h2>
<ol>
  <li>Clone the repository:
    <pre><code>git clone https://github.com/KabeloDev/credit_card_validator.git</code></pre>
  </li>
  <li>Navigate to the project directory:
    <pre><code>cd credit_card_validator</code></pre>
  </li>
  <li>Install dependencies:
    <pre><code>flutter pub get</code></pre>
  </li>
  <br/>
  <li>Connect an Android device or start an Android emulator.</li>
  <br/>
  <li>Run the app:
    <pre><code>flutter run</code></pre>
  </li>
</ol>

<hr>

<h2>Program Walk-through</h2>

<h3>Card Form</h3>
<p>Submit credit card details using the form. The card type is automatically inferred as you type.</p>
<img src="https://i.imgur.com/BRuWMqC.png" alt="Card Form Screenshot" width="500" height="500">

<h3>Card List</h3>
<p>View all stored cards in a scrollable list. Duplicate cards and cards from banned countries are prevented.</p>
<img src="https://i.imgur.com/s2IenlK.png" alt="Card List Screenshot" width="500" height="500">

<h3>Banned Countries</h3>
<p>Manage the list of banned countries. Cards from these countries cannot be added. Users can add, edit, or remove countries.</p>
<img src="https://i.imgur.com/KaaG0nI.png" alt="Banned Countries Screenshot" width="500" height="500">


<hr>
