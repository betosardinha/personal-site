<script lang="ts">
  import './layout.css';
  import Navbar from '$lib/components/Navbar.svelte';

  let { children } = $props();
</script>

<svelte:head>
  <link rel="icon" href="/favicon.svg" type="image/svg+xml" />
  <title>betosardinha</title>
  <meta name="description" content="Personal website" />
</svelte:head>

<header class="px-10 xl:px-80 lg:px-50 md:px-40 sticky top-0 bg-background pb-4 z-10">
  <Navbar />
</header>

<main class="flex-1 px-10 xl:px-80 lg:px-50 md:px-40 mt-8">
  {@render children?.()}
</main>
