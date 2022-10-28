defmodule LiveviewWithAlpineWeb.ExampleLive do
  use LiveviewWithAlpineWeb, :live_view
  def mount(_params, _sessions, socket) do
    {:ok, assign(socket, :name, "Nathan")}
  end

  def toggle(name) do
    upper = String.upcase(name)
    if name != upper do
      upper
    else
      String.downcase(name)
    end
  end

  def handle_event("toggle", _metadata, socket) do
    updated = toggle(socket.assigns.name)
    {:noreply, assign(socket, :name, updated)}
  end

  def render(assigns) do
    ~H"""
    <h1
      class={
        "#{if @name == String.upcase(@name),
          do: "text-purple-500",
          else: "text-green-500"}"
          }
      phx-click="toggle">
        Name: <%= @name%>
        </h1>
        <br />


        <h1
          x-data="my_name"
          x-bind:class="className"
          @click="toggle"
          >
            Name2:
            <span x-text="name"/>
          </h1>
    """
  end
end
