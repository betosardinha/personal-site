<script lang="ts">
  import './layout.css';
  import favicon from '$lib/assets/favicon.svg';
  // import { Separator } from "$lib/components/ui/separator/index.js";
  import * as Sidebar from '$lib/components/ui/sidebar/index.js';
  import AppSidebar from '$lib/components/app-sidebar.svelte';

  let { children } = $props();
</script>

<svelte:head>
  <link rel="icon" href={favicon} />
  <title>Beto Sardinha</title>
  <meta name="description" content="Personal website" />
</svelte:head>

<Sidebar.Provider style="--sidebar-width: 20rem">
  <AppSidebar />
  <div class="flex flex-1 flex-col">
    <header class="flex items-center gap-3 border-b px-4 py-3 md:hidden">
      <Sidebar.Trigger />
      <span class="text-base font-semibold">Beto Sardinha</span>
    </header>

    <main class="flex-1 px-10 md:px-40">
      {@render children?.()}
    </main>
  </div>
</Sidebar.Provider>
