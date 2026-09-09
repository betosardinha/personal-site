<script lang="ts">
  import { Button } from '$lib/components/ui/button/index.js';
  import X from '@lucide/svelte/icons/x';
  import Menu from '@lucide/svelte/icons/menu';

  let { open = $bindable(false), class: className }: { open?: boolean; class?: string } = $props();
</script>

<Button variant="ghost" size="icon" class={className} onclick={() => (open = !open)} aria-label="Toggle menu">
  {#if open}
    <X size={18} />
  {:else}
    <Menu size={18} />
  {/if}
</Button>
