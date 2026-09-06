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

<header class="px-10 lg:px-80 sticky top-2">
  <Navbar />
</header>

<main class="flex-1 px-10 lg:px-80 mt-8">
  {@render children?.()}
</main>
