<script lang="ts">
  import './layout.css';
  import favicon from '$lib/assets/favicon.svg';

  let { children } = $props();
</script>

<svelte:head>
  <link rel="icon" href={favicon} />
  <title>Beto Sardinha</title>
  <meta name="description" content="Personal website" />
</svelte:head>

<main class="flex-1 px-10 md:px-40">
  {@render children?.()}
</main>
