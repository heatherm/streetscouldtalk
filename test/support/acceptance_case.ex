defmodule StreetsCouldTalk.AcceptanceCase do
  use ExUnit.CaseTemplate

  using do
    quote do
      use Wallaby.DSL

      alias StreetsCouldTalk.Repo
      import Ecto
      import Ecto.Changeset
      import Ecto.Query

      import StreetsCouldTalkWeb.Router.Helpers
    end
  end

  setup tags do
    :ok = Ecto.Adapters.SQL.Sandbox.checkout(StreetsCouldTalk.Repo)

    unless tags[:async] do
      Ecto.Adapters.SQL.Sandbox.mode(StreetsCouldTalk.Repo, {:shared, self()})
    end

    metadata = Phoenix.Ecto.SQL.Sandbox.metadata_for(StreetsCouldTalk.Repo, self())
    {:ok, session} = Wallaby.start_session(metadata: metadata)
    {:ok, session: session}
  end
end
