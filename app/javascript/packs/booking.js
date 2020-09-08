export function add_participants() {

const button = document.getElementById('plus')
button.addEventListener('click', (event) => {
  console.log("+")
  // selecting the counter
  const counter = document.getElementById('counter');
  // defining offset which is either 1 or -1
  const offset = Number.parseInt(event.currentTarget.dataset.offset, 10);
  // defining count which should be the new value of the counter (current value + offset)
  const count = Number.parseInt(counter.dataset.count, 10) + offset;
  console.log(count)
  // replacing
  counter.dataset.count = count;
  console.log(count)
  counter.innerHTML = count;
  console.log(count)
});



};




