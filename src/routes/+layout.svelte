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

<header class="mx-auto max-w-4xl px-4 sm:px-6 lg:px-8 sticky top-0 bg-background pb-4 z-10">
  <Navbar />
</header>

<main class="mx-auto max-w-4xl flex-1 px-4 sm:px-6 lg:px-8 mt-8">
  {@render children?.()}
</main>
