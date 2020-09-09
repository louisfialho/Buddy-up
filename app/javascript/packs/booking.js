export function add_participants() {

const updateCounter = (counter, count) => {
  counter.dataset.count = count;
  counter.innerText = count;
};


  const updateForm = (event) => {
  const offset = Number.parseInt(event.currentTarget.dataset.offset, 10);
  const counter = document.getElementById('counter');
  const count = Number.parseInt(counter.dataset.count, 10) + offset;
  if (count >= 1) {
    updateCounter(counter, count);
  } else {
    event.preventDefault();
  }
};


  const updateFormOnButtonClick = (button) => {
  button.addEventListener('click', updateForm);
};

  const buttons = document.querySelectorAll('.incrementer');
  buttons.forEach(updateFormOnButtonClick);
};






