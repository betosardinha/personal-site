<script lang="ts">
  import { onMount } from 'svelte';
  import { Button } from '$lib/components/ui/button/index.js';
  import Palette from '@lucide/svelte/icons/palette';

  let { class: className }: { class?: string } = $props();

  const colors = [
    { name: 'Red', value: '#ef4444' },
    { name: 'Blue', value: '#3b82f6' },
    { name: 'Green', value: '#22c55e' }
  ];

  let open = $state(false);
  let selected = $state(colors[0].value);

  onMount(() => {
    selected = getComputedStyle(document.documentElement).getPropertyValue('--accent-color').trim() || colors[0].value;
  });

  function select(value: string) {
    selected = value;
    document.documentElement.style.setProperty('--accent-color', value);
    localStorage.setItem('accent-color', value);
    open = false;
  }
</script>

<div class="relative">
  <Button variant="ghost" size="icon" class={className} onclick={() => (open = !open)} aria-label="Change accent color">
    <Palette size={18} />
  </Button>

  {#if open}
    <button
      type="button"
      class="fixed inset-0 z-10 cursor-default"
      aria-label="Close color picker"
      onclick={() => (open = false)}
    ></button>
    <div class="absolute top-full right-0 z-20 mt-2 flex gap-2 rounded-md border border-border bg-background p-2 shadow-md">
      {#each colors as color (color.value)}
        <button
          type="button"
          class="size-6 rounded-full ring-offset-2 ring-offset-background transition-transform hover:scale-110"
          class:ring-2={selected === color.value}
          class:ring-foreground={selected === color.value}
          style:background-color={color.value}
          aria-label={color.name}
          onclick={() => select(color.value)}
        ></button>
      {/each}
    </div>
  {/if}
</div>
