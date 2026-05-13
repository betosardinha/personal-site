<script lang="ts">
  import './layout.css';
  import favicon from '$lib/assets/favicon.svg';

  let { children } = $props();
</script>

<svelte:head>
  <link rel="icon" href={favicon} />
  <title>Beto Sardinha - Developer</title>
  <meta name="description" content="Personal website" />
</svelte:head>

{@render children()}
