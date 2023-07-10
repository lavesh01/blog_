<div id="chart"></div>
<form id="options-form">
  <h2>Options</h2>
  <div>
    <label for="name">Series Name:</label>
    <input type="text" id="name" name="name" value="Desktops">
  </div>
  <div>
    <label for="data">Series Data:</label>
    <input type="text" id="data" name="data" value="10, 41, 35, 51, 49, 62, 69, 91, 148">
  </div>
  <div>
    <label for="height">Chart Height:</label>
    <input type="number" id="height" name="height" value="350">
  </div>
  <div>
    <label for="type">Chart Type:</label>
    <select id="type" name="type">
      <option value="line">Line</option>
      <option value="bar">Bar</option>
    </select>
  </div>
  <div>
    <label for="title">Chart Title:</label>
    <input type="text" id="title" name="title" value="Product Trends by Month">
  </div>
  <div>
    <button type="submit">Update</button>
  </div>
</form>
