defmodule LiveviewWithAlpineWeb.Dropdown do
  use LiveviewWithAlpineWeb, :live_view

  def mount(_params, _session, socket) do
    socket = assign(socket, :counter, 0)
    {:ok, socket}
  end

  # for this example, use "assign"
  def handle_event("increase", _metadata, socket) do
    counter = socket.assigns.counter + 1
    socket = assign(socket, :counter, counter)
    {:noreply, socket}
  end

  # for this example, use "update"
  def handle_event("decrease", _metadata, socket) do
    # counter = socket.assigns.counter - 1
    socket = update(socket, :counter, &(&1 - 1))
    {:noreply, socket}
  end

  def render(assigns) do
    ~H"""
    <h1>Counter: <%= @counter %></h1>
    <button phx-click="increase">+</button>
    <button phx-click="decrease">-</button>
    <br />
    <section>
  <h2>Alpine JS Installed</h2>
  <div x-data="{name:''}">
    <label for="name">Name:</label>
    <input id="name" type="text" x-model="name" />
    <p><br><b><em>Output:</em></b> <span x-text="name"></span></p>
  </div>
</section>
<h2 class="text-red-500 text-5xl font-bold text-center">Tailwind CSS with Alpine JS Dropdown</h2>
 <!-- alpinejs counter test -->
  <div>
    <p class="mt-5 font-bold text-center">Counter with Component Buttons</p>
  </div>
  <!--
    If you want a box around the counter use:
    <div class="flex items-center justify-center h-screen bg-gray-200">
  -->
  <div class="mt-10 flex justify-center" x-data="{ count: 0 }">
    <button class="btn-redish" x-on:click="count--">Decrement</button>
    <code>count: </code><code x-text="count"></code>
    <button class="btn-greenish" x-on:click="count++">Increment</button>
  </div>
    """
  end
end
