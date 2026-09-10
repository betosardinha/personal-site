<script lang="ts">
  import { onMount } from 'svelte';
  import Palette from '@lucide/svelte/icons/palette';
  import * as Popover from '$lib/components/ui/popover/index.js';
  import { buttonVariants } from '$lib/components/ui/button/index.js';
  import { RadioGroup, RadioGroupItem } from '$lib/components/ui/radio-group/index.js';
  import { cn } from '$lib/utils.js';

  let { class: className }: { class?: string } = $props();

  const colors = [
    { name: 'Red', value: 'var(--accent-color-red)' },
    { name: 'Blue', value: 'var(--accent-color-blue)' },
    { name: 'Green', value: 'var(--accent-color-green)' }
  ];

  let open = $state(false);
  let selected = $state(colors[0].value);

  onMount(() => {
    selected = localStorage.getItem('accent-color') ?? colors[0].value;
  });

  function select(value: string) {
    selected = value;
    document.documentElement.style.setProperty('--accent-color', value);
    localStorage.setItem('accent-color', value);
    open = false;
  }
</script>

<Popover.Root bind:open>
  <Popover.Trigger
    class={cn(buttonVariants({ variant: 'ghost', size: 'icon' }), className)}
    aria-label="Change accent color"
  >
    <Palette size={18} />
  </Popover.Trigger>

  <Popover.Content class="w-fit">
    <RadioGroup value={selected} onValueChange={select} class="flex flex-row gap-2">
      {#each colors as color (color.value)}
        <RadioGroupItem
          value={color.value}
          style="background-color:{color.value}"
          aria-label={color.name}
        />
      {/each}
    </RadioGroup>
  </Popover.Content>
</Popover.Root>
