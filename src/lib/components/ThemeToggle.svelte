<script lang="ts">
  import { onMount } from 'svelte';
  import { Button } from '$lib/components/ui/button/index.js';
  import Sun from '@lucide/svelte/icons/sun';
  import Moon from '@lucide/svelte/icons/moon';

  let { class: className }: { class?: string } = $props();

  let dark = $state(false);

  onMount(() => {
    dark = document.documentElement.classList.contains('dark');
  });

  function toggle() {
    dark = !dark;
    document.documentElement.classList.toggle('dark', dark);
    localStorage.setItem('theme', dark ? 'dark' : 'light');
  }
</script>

<Button variant="ghost" size="icon" class={className} onclick={toggle} aria-label="Toggle theme">
  {#if dark}
    <Sun size={18} />
  {:else}
    <Moon size={18} />
  {/if}
</Button>
